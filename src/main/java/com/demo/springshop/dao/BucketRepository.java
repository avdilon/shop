package com.demo.springshop.dao;

import com.demo.springshop.entities.Bucket;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BucketRepository extends JpaRepository<Bucket, Long> {

}
