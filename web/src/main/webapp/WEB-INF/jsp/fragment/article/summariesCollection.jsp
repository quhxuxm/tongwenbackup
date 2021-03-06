<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
         language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="tongwen" tagdir="/WEB-INF/tags" %>
<c:url var="articleSummariesCollectionUrl" value="/article/allPublishedArticleSummariesCollection" >
    <c:param name="start" value="${nextStart}"/>
</c:url>
<section class="card-container" data-url="${articleSummariesCollectionUrl}">
    <div class="card-container-column">
        <c:forEach var="articleSummary" items="${summariesCollection}" varStatus="loop">
            <c:url var="viewArticleUrl" value="/article/${articleSummary.id}/view"/>
            <c:url var="viewAuthorUrl" value="/author/${articleSummary.authorId}/view"/>
            <tongwen:card index="${loop.index + nextStart}" authorIconImageId="${articleSummary.authorIconImageId}"
                          summary="${articleSummary.summary}"
                          authorNickName="${articleSummary.authorNickName}"
                          publishDate="${articleSummary.publishDate}"
                          coverImageId="${articleSummary.coverImageId}"
                          title="${articleSummary.title}" commentList="${null}"
                          currentAuthorIconImageId="${sessionScope.get('authenticatedAuthor').iconImageId}"
                          currentAuthorNickName="${sessionScope.get('authenticatedAuthor').nickName}"
                          additionalActions="${null}" viewAuthorUrl="${viewAuthorUrl}"
                          viewDetailUrl="${viewArticleUrl}"/>
            <c:remove var="viewArticleUrl"/>
            <c:remove var="viewAuthorUrl"/>
        </c:forEach>
    </div>
</section>
