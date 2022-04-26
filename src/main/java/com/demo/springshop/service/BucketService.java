package com.demo.springshop.service;

import com.demo.springshop.dto.BucketDTO;
import com.demo.springshop.entities.Bucket;
import com.demo.springshop.entities.User;

import java.util.List;

public interface BucketService {

    Bucket createBucket(User user, List<Long> productIds);

    void addProducts(Bucket bucket, List<Long> productIds);

    BucketDTO getBucketByUser(String name);

}
