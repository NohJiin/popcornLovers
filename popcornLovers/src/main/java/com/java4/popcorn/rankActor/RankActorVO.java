package com.java4.popcorn.rankActor;

import lombok.Data;

@Data
public class RankActorVO {
	private int rank_no;
	private Integer actorPopularity;
    private int actorId;
    private String actorName;
    private String actorFilmo;
    private Integer actorLike;
    private Integer actorHits;
}