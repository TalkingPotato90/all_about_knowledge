<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Video Popup</title>
</head>
<body>
    <h1><%= request.getParameter("title") %></h1>
    <video id="videoPlayer" width="560" controls>
        <source src="" type="video/mp4">
    </video>

    <script>
        // 동영상 URL 설정
        var videoUrl = "http://localhost/all_about_knowledge/upload/sample.mp4"; //sample.mp4는 됨
 
        document.getElementById('videoPlayer').querySelector('source').src = videoUrl;
        document.getElementById('videoPlayer').load(); // 동영상 재생 준비

        // 팝업창 외부를 클릭하면 팝업창 닫기
        document.addEventListener('click', function(event) {
            if (!document.getElementById('videoPlayer').contains(event.target)) {
                window.close();
            }
        });
    </script>
</body>
</html>