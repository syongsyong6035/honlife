package com.honlife.core.app.model.home;


import com.honlife.core.app.controller.member.MemberResponseWrapper;
import com.honlife.core.app.controller.member.payload.MemberBadgeResponse;
import com.honlife.core.app.controller.member.payload.MemberItemResponse;
import com.honlife.core.app.controller.member.payload.MemberPayload;
import com.honlife.core.app.controller.quest.payload.EventQuestProgressResponse;
import com.honlife.core.app.controller.quest.payload.WeeklyQuestProgressResponse;
import com.honlife.core.app.controller.quest.wrapper.AllQuestsProgressWrapper;
import com.honlife.core.app.controller.routine.payload.RoutinesTodayResponse;
import com.honlife.core.app.model.home.model.HomeDataResponse;
import com.honlife.core.app.model.member.domain.Member;
import com.honlife.core.app.model.member.model.MemberBadgeDetailDTO;
import com.honlife.core.app.model.member.model.MemberDTO;
import com.honlife.core.app.model.member.service.MemberBadgeService;
import com.honlife.core.app.model.member.service.MemberItemService;
import com.honlife.core.app.model.member.service.MemberPointService;
import com.honlife.core.app.model.member.service.MemberService;
import com.honlife.core.app.model.quest.service.EventQuestProgressService;
import com.honlife.core.app.model.quest.service.WeeklyQuestProgressService;
import com.honlife.core.app.model.routine.dto.RoutineTodayItemDTO;
import com.honlife.core.app.model.routine.service.RoutineService;
import com.honlife.core.infra.response.CommonApiResponse;
import com.honlife.core.infra.response.ResponseCode;
import java.time.LocalDate;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.Executor;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class HomeFacadeService {

  private static final Logger log = LoggerFactory.getLogger(HomeFacadeService.class);
  @Qualifier("homeApiExecutor")
  private final Executor executor;

  private final RoutineService routineService;
  private final MemberService memberService;
  private final MemberBadgeService memberBadgeService;
  private final MemberPointService memberPointService;
  private final MemberItemService memberItemService;
  private final WeeklyQuestProgressService weeklyQuestProgressService;
  private final EventQuestProgressService eventQuestProgressService;

  //병렬 처리를 해서 빠르게
  @Transactional(readOnly = true)
  public HomeDataResponse getHomeData(String userEmail){

    //오늘 루틴 조회
    CompletableFuture<RoutinesTodayResponse> routinesFuture = CompletableFuture.supplyAsync(() -> {
      List<RoutineTodayItemDTO> routines = routineService.getTodayRoutines(userEmail);
      return new RoutinesTodayResponse(routines, LocalDate.now());
    }, executor);

    //프로필 정보 닉네임 및 배지
    CompletableFuture<MemberResponseWrapper> profile = CompletableFuture.supplyAsync(() ->{
      MemberDTO targetMember = memberService.findMemberByEmail(userEmail);
      if(targetMember == null) {
        throw new RuntimeException("회원의 찾을수 없습니다"); }
      MemberPayload member = MemberPayload.fromDTO(targetMember);

      MemberBadgeDetailDTO badge = memberBadgeService.getEquippedBadge(userEmail);


      return new MemberResponseWrapper(member, MemberBadgeResponse.fromDTO(badge));

    }, executor);

    //보유 포인트

    CompletableFuture<Integer> point = CompletableFuture.supplyAsync(() -> {
      Integer points = memberPointService.getMemberPoint(userEmail).getPoint();
      return points < 0 ? 0 : points;

    }, executor);

    //보유 아이템
    CompletableFuture<List<MemberItemResponse>> items = CompletableFuture.supplyAsync(() -> {
      Member member = memberService.getMemberByEmail(userEmail);
      return MemberItemResponse.fromDTOList(memberItemService.getItemsByMember(member.getId(), null));

    }, executor).exceptionally(ex -> {
      return Collections.emptyList();
    });

    CompletableFuture<AllQuestsProgressWrapper> quests = CompletableFuture.supplyAsync(() -> {
      List<WeeklyQuestProgressResponse> weeklyQuestProgressResponse = WeeklyQuestProgressResponse.fromDTOList(
          weeklyQuestProgressService.getMemberWeeklyQuestsProgress(userEmail)
      );
      List<EventQuestProgressResponse> eventQuestProgressResponse = EventQuestProgressResponse.fromDTOList(
          eventQuestProgressService.getMemberEventQuestsProgress(userEmail)
      );
      return new AllQuestsProgressWrapper(weeklyQuestProgressResponse, eventQuestProgressResponse);
    }, executor).exceptionally(ex -> {
      log.info("퀘스트 조회 중 에러 발생: {}", ex.getMessage());

      return new AllQuestsProgressWrapper(Collections.emptyList(), Collections.emptyList());
    });

    return CompletableFuture.allOf(routinesFuture, profile, point, items)
        .thenApply(v -> new HomeDataResponse(routinesFuture.join(), profile.join(), point.join(), items.join(), quests.join()))
        .join();

  }

}
