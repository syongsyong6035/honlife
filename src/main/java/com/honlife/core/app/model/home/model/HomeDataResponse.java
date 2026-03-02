package com.honlife.core.app.model.home.model;

import com.honlife.core.app.controller.member.MemberResponseWrapper;
import com.honlife.core.app.controller.member.payload.MemberItemResponse;
import com.honlife.core.app.controller.quest.wrapper.AllQuestsProgressWrapper;
import com.honlife.core.app.controller.routine.payload.RoutinesTodayResponse;
import java.util.List;
import java.util.Map;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@Getter
@Setter
@NoArgsConstructor
public class HomeDataResponse {

  private RoutinesTodayResponse todayRoutines;

  private MemberResponseWrapper profile;

  private Integer point;

  private List<MemberItemResponse> userItems;

  private AllQuestsProgressWrapper quests;


}
