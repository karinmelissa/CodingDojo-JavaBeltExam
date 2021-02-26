package com.karin.examen.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.karin.examen.models.Ideas;

@Repository
public interface IdeasRepository extends CrudRepository<Ideas, Long>{
	Iterable<Ideas> findAllByOrderByLikesAsc();
	Iterable<Ideas> findAllByOrderByLikesDesc();

}
