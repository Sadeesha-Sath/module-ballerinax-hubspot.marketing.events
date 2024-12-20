import ballerina/oauth2;
import ballerina/test;

configurable string serviceUrl = ?;
configurable string refreshToken = ?;
configurable string clientId = ?;
configurable string clientSecret = ?;

OAuth2RefreshTokenGrantConfig auth = {
    clientId: clientId,
    clientSecret: clientSecret,
    refreshToken: refreshToken,
    credentialBearer: oauth2:POST_BODY_BEARER // this line should be added in to when you are going to create auth object.
};

ConnectionConfig config = {auth: auth};
final Client hubspotClient = check new Client(config, serviceUrl);

@test:Config {
    groups: ["live_server", "mock_server"]
}
isolated function GetMarketingEvents() returns error? {
    CollectionResponseMarketingEventPublicReadResponseV2ForwardPaging|error? resp = check hubspotClient->/marketing/v3/marketing\-events;

    if (resp is CollectionResponseMarketingEventPublicReadResponseV2ForwardPaging) {
        test:assertTrue(resp.hasKey("results"));
    } else {
        test:assertFail("Returned Error");
    }
}

@test:Config {
    groups: ["live_server", "mock_server"]
}
isolated function GetApplicationSettings(int:Signed32 appId) returns error? {
    EventDetailSettings|error resp = check hubspotClient->/marketing/v3/marketing\-events/[appId]/settings();

    if (resp is EventDetailSettings) {
        test:assertTrue(resp.appId is int:Signed32 && resp.appId == appId);
        test:assertTrue(resp.eventDetailsUrl is string);
    } else {
        test:assertFail("Returned Error");
    }
}

isolated function GetMarketingEventsbyExternalEventID(string externalEventId) returns error? {
    CollectionResponseWithTotalMarketingEventIdentifiersResponseNoPaging | error resp = check hubspotClient->/marketing/v3/marketing\-events/[externalEventId]/identifiers();

    if (resp is CollectionResponseWithTotalMarketingEventIdentifiersResponseNoPaging) {
        test:assertTrue(resp.hasKey("results"));
    } else {
        test:assertFail("Returned Error");
    }
}


isolated function GetMarketingEventByObjectID(string objectId) returns error? {
    MarketingEventPublicReadResponseV2 | error resp = check hubspotClient->/marketing/v3/marketing\-events/[objectId]();

    if (resp is MarketingEventPublicReadResponseV2) {
        test:assertTrue(resp.objectId !is "" && resp.objectId == objectId);
        test:assertTrue(resp.eventName is string);
    } else {
        test:assertFail("Returned Error");
    }
}