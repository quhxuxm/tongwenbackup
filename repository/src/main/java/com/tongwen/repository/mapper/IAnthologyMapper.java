package com.tongwen.repository.mapper;

import com.tongwen.domain.Anthology;
import com.tongwen.domain.AnthologyAdditionalInfo;
import com.tongwen.domain.AnthologyDetail;
import com.tongwen.domain.AnthologySummary;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IAnthologyMapper {
    List<AnthologySummary> getSummariesOrderByPublishDate(@Param("start") int start,
        @Param("pageSize") int pageSize, @Param("isDesc") boolean isDesc);

    List<AnthologySummary> getSummariesOrderByFollowupNumber(@Param("start") int start,
        @Param("pageSize") int pageSize, @Param("isDesc") boolean isDesc);

    List<AnthologySummary> getSummariesOrderByArticleNumber(@Param("start") int start,
        @Param("pageSize") int pageSize, @Param("isDesc") boolean isDesc);

    AnthologyDetail getAnthologyDetail(@Param("id") long id);

    void update(Anthology anthology);

    void create(Anthology anthology);

    Anthology getOne(long id);

    AnthologyAdditionalInfo getAdditionalInfo(@Param("anthologyId") long anthologyId);

    void createAdditionalInfo(AnthologyAdditionalInfo additionalInfo);

    void updateAdditionalInfo(AnthologyAdditionalInfo additionalInfo);

    List<AnthologySummary> getAuthorAnthologySummaries(@Param("authorId") long authorId,
        @Param("start") int start, @Param("pageSize") int pageSize,
        @Param("isDesc") boolean isDesc);
}
