package com.honlife.core.app.controller.common;

import com.honlife.core.app.model.home.HomeFacadeService;
import com.honlife.core.app.model.home.model.HomeDataResponse;
import com.honlife.core.infra.response.CommonApiResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequiredArgsConstructor
@Slf4j
@RestController
@RequestMapping(value = "/api/v1/home", produces = MediaType.APPLICATION_JSON_VALUE)

public class HomeDataController {

  private final HomeFacadeService homeFacadeService;

  @GetMapping
  public ResponseEntity<CommonApiResponse<HomeDataResponse>> HomeData(@AuthenticationPrincipal
      UserDetails userDetails){
    HomeDataResponse response = homeFacadeService.getHomeData(userDetails.getUsername());

    return ResponseEntity.ok(CommonApiResponse.success(response));
  }

}
