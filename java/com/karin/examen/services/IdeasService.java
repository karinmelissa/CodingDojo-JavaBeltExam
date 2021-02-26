package com.karin.examen.services;

import java.util.Optional;

import org.springframework.stereotype.Service;

import com.karin.examen.repositories.IdeasRepository;
import com.karin.examen.models.Ideas;

@Service
public class IdeasService {
	private final IdeasRepository ideaRepo;
	
	public IdeasService(IdeasRepository ideaRepo) {
		this.ideaRepo = ideaRepo;
		
	}
	public Iterable<Ideas> allIdeas() {
        return ideaRepo.findAll();
    }
    public Iterable<Ideas> allIdeasAsc() {
        return ideaRepo.findAllByOrderByLikesAsc();
    }
    public Iterable<Ideas> allIdeasDsc() {
        return ideaRepo.findAllByOrderByLikesDesc();
    }
    public Ideas findIdea (Long id) {
        Optional<Ideas> optionalIdea = ideaRepo.findById(id);
        if(optionalIdea.isPresent()) {
            return optionalIdea.get();
        } else {
            return null;
        }
    }
    
    public Ideas createIdea(Ideas i) {
        return ideaRepo.save(i);
    }
    
    
    
    public Ideas updateIdea(Ideas idea ) {
        Optional<Ideas> optionalIdea = ideaRepo.findById(idea.getId());
        if(optionalIdea.isPresent()) {
            Ideas i= optionalIdea.get();
            i.setTitle(idea.getTitle());
            i.setCreatedBy(idea.getCreatedBy());
            i.setLikes(idea.getLikes());
            i.setUsers(idea.getUsers());
            return ideaRepo.save(i);  
        } else {
            return null;
        }

    }

    //Delete
    public  void deleteIdea(Long id) {
    	ideaRepo.deleteById(id);
    }

}
