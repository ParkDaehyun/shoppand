package com.pdh.shoppand_17.model.repository;

import java.util.List;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.pdh.shoppand_17.model.entity.Groups;
import com.pdh.shoppand_17.model.entity.Shares;

public interface ShareRepository extends CrudRepository<Shares, Long> {
	
	@Query(value="select * from shares sh where sh.group_id in (select group_id from group_members gm where gm.user_email = ?1)", nativeQuery= true)
	List<Shares> getMemberGroupShare(String email);
	
	List<Shares> findByWriter(String email);
	
	//@Query(value="select * from shares sh where sh.group_id in (select group_id from group_members gm where gm.user_email = ?1) and sh.access_auth = 1", nativeQuery= true)
	List<Shares> findByWriterAndAccessAuth(String writer, int accessAuth);

	List<Shares> findByGroup(Groups group, Pageable pageable);

	List<Shares> findByGroupAndCategory(Groups group, String category, Pageable pageable);
	
	List<Shares> findByGroupAndCategory(Groups group, String category);

	List<Shares> findByLikesGreaterThan(int likes);
	
	@Query(value="select DISTINCT share_id from like_shares ls order by share_id asc", nativeQuery= true)
	List<Long>  findLikedShares();
	
	@Query(value="select DISTINCT email from like_shares ls order by email asc", nativeQuery= true)
	List<String>  findShareLikingMember();
	
	@Query(value="select share_id from like_shares ls order by ls.email asc", nativeQuery= true)
	List<Long>  findLikedSharesNotDis();
	
	@Query(value="select email from like_shares ls order by ls.email asc", nativeQuery= true)
	List<String>  findShareLikingMemberNotDis();
	
}
