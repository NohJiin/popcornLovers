package com.java4.popcorn.data.MongoMember;

import lombok.Data;

import java.util.List;

@Data
public class MongoMemberVO {
    //String _id;
    String id;
    List<String> theater_favorites;
    List<String> movie_favorites;
}
