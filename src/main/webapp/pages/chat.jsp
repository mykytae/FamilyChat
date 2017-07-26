<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="en">

<head>
    <style>
        <%@ include file="css/style.css"%>
    </style>
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700" rel="stylesheet" type="text/css"/>

</head>

<body ng-app="chatApp">

<div ng-controller="ChatCtrl" class="container">
    <form ng-submit="addMessage()" name="messageForm">
        <input type="text" placeholder="Compose a new message..." ng-model="message"/>
        <div class="info">
            <span class="count" ng-bind="max - message.length" ng-class="{danger: message.length > max}">500</span>
            <button ng-disabled="message.length > max || message.length === 0">Send</button>
        </div>
    </form>
    <hr/>
    <p ng-repeat="message in messages | orderBy:'time':true" class="message">
        <time>{{message.time | date:'HH:mm'}}</time>
        <span ng-class="{self: message.self}">{{message.message}}</span>
    </p>
</div>

<script>
    <%@ include file="libs/sockjs/sockjs.min.js"%>
    <%@ include file="libs/stomp-websocket/lib/stomp.min.js"%>
    <%@ include file="libs/angular/angular.min.js"%>
    <%@ include file="libs/lodash/dist/lodash.min.js"%>
    <%@ include file="config/app.js"%>
    <%@ include file="config/controllers.js"%>
    <%@ include file="config/services.js"%>
</script>

</body>

</html>
