// AUTO-GENERATED FILE. DO NOT MODIFY.
// This file is auto-generated by the Ballerina OpenAPI tool.

// Copyright (c) 2024, WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;

public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig? apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://api.hubapi.com/marketing/v3/marketing-events") returns error? {
        http:ClientConfiguration httpClientConfig = {httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        if config.auth is ApiKeysConfig {
            self.apiKeyConfig = (<ApiKeysConfig>config.auth).cloneReadOnly();
        } else {
            httpClientConfig.auth = <http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig>config.auth;
            self.apiKeyConfig = ();
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
    }

    # Delete Marketing Event by objectId
    #
    # + objectId - The internal ID of the marketing event in HubSpot
    # + headers - Headers to be sent with the request 
    # + return - No content 
    resource isolated function delete [string objectId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/${getEncodedUri(objectId)}`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        return self.clientEp->delete(resourcePath, headers = httpHeaders);
    }

    # Disassociate a list from a marketing event
    #
    # + externalAccountId - The accountId that is associated with this marketing event in the external event application.
    # + externalEventId - The id of the marketing event in the external event application.
    # + listId - The ILS ID of the list.
    # + headers - Headers to be sent with the request 
    # + return - No content 
    resource isolated function delete associations/[string externalAccountId]/[string externalEventId]/lists/[string listId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/associations/${getEncodedUri(externalAccountId)}/${getEncodedUri(externalEventId)}/lists/${getEncodedUri(listId)}`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        return self.clientEp->delete(resourcePath, headers = httpHeaders);
    }

    # Disassociate a list from a marketing event
    #
    # + marketingEventId - The internal id of the marketing event in HubSpot.
    # + listId - The ILS ID of the list.
    # + headers - Headers to be sent with the request 
    # + return - No content 
    resource isolated function delete associations/[string marketingEventId]/lists/[string listId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/associations/${getEncodedUri(marketingEventId)}/lists/${getEncodedUri(listId)}`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        return self.clientEp->delete(resourcePath, headers = httpHeaders);
    }

    # Delete Marketing Event by External Ids
    #
    # + externalEventId - The id of the marketing event in the external event application
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - No content 
    resource isolated function delete events/[string externalEventId](map<string|string[]> headers = {}, *DeleteEventsExternaleventid_archiveQueries queries) returns http:Response|error {
        string resourcePath = string `/events/${getEncodedUri(externalEventId)}`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        return self.clientEp->delete(resourcePath, headers = httpHeaders);
    }

    # Get all marketing event
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - successful operation 
    resource isolated function get .(map<string|string[]> headers = {}, *GetQueries queries) returns CollectionResponseMarketingEventPublicReadResponseV2ForwardPaging|error {
        string resourcePath = string `/`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # Retrieve the application settings
    #
    # + appId - The id of the application to retrieve the settings for.
    # + headers - Headers to be sent with the request 
    # + return - successful operation 
    resource isolated function get [int:Signed32 appId]/settings(map<string|string[]> headers = {}) returns EventDetailSettings|error {
        string resourcePath = string `/${getEncodedUri(appId)}/settings`;
        map<anydata> queryParam = {};
        if self.apiKeyConfig is ApiKeysConfig {
            queryParam["hapikey"] = self.apiKeyConfig?.hapikey;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        return self.clientEp->get(resourcePath, headers);
    }

    # Find Marketing Events by externalEventId
    #
    # + externalEventId - The id of the marketing event in the external event application.
    # + headers - Headers to be sent with the request 
    # + return - successful operation 
    resource isolated function get [string externalEventId]/identifiers(map<string|string[]> headers = {}) returns CollectionResponseWithTotalMarketingEventIdentifiersResponseNoPaging|error {
        string resourcePath = string `/${getEncodedUri(externalEventId)}/identifiers`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # Get Marketing Event by objectId
    #
    # + objectId - The internal ID of the marketing event in HubSpot
    # + headers - Headers to be sent with the request 
    # + return - successful operation 
    resource isolated function get [string objectId](map<string|string[]> headers = {}) returns MarketingEventPublicReadResponseV2|error {
        string resourcePath = string `/${getEncodedUri(objectId)}`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # Get lists associated with a marketing event
    #
    # + externalAccountId - The accountId that is associated with this marketing event in the external event application
    # + externalEventId - The id of the marketing event in the external event application.
    # + headers - Headers to be sent with the request 
    # + return - successful operation 
    resource isolated function get associations/[string externalAccountId]/[string externalEventId]/lists(map<string|string[]> headers = {}) returns CollectionResponseWithTotalPublicListNoPaging|error {
        string resourcePath = string `/associations/${getEncodedUri(externalAccountId)}/${getEncodedUri(externalEventId)}/lists`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # Get lists associated with a marketing event
    #
    # + marketingEventId - The internal id of the marketing event in HubSpot.
    # + headers - Headers to be sent with the request 
    # + return - successful operation 
    resource isolated function get associations/[string marketingEventId]/lists(map<string|string[]> headers = {}) returns CollectionResponseWithTotalPublicListNoPaging|error {
        string resourcePath = string `/associations/${getEncodedUri(marketingEventId)}/lists`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # Get Marketing Event by External IDs
    #
    # + externalEventId - The id of the marketing event in the external event application
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - successful operation 
    resource isolated function get events/[string externalEventId](map<string|string[]> headers = {}, *GetEventsExternaleventid_getdetailsQueries queries) returns MarketingEventPublicReadResponse|error {
        string resourcePath = string `/events/${getEncodedUri(externalEventId)}`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # Find App-Specific Marketing Events by External Event Id
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - successful operation 
    resource isolated function get events/search(map<string|string[]> headers = {}, *GetEventsSearch_dosearchQueries queries) returns CollectionResponseSearchPublicResponseWrapperNoPaging|error {
        string resourcePath = string `/events/search`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # Read participations counters by Marketing Event internal identifier
    #
    # + marketingEventId - The internal id of the marketing event in HubSpot.
    # + headers - Headers to be sent with the request 
    # + return - successful operation 
    resource isolated function get participations/[int marketingEventId](map<string|string[]> headers = {}) returns AttendanceCounters|error {
        string resourcePath = string `/participations/${getEncodedUri(marketingEventId)}`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # Read participations breakdown by Marketing Event internal identifier
    #
    # + marketingEventId - The internal id of the marketing event in HubSpot.
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - successful operation 
    resource isolated function get participations/[int marketingEventId]/breakdown(map<string|string[]> headers = {}, *GetParticipationsMarketingeventidBreakdown_getparticipationsbreakdownbymarketingeventidQueries queries) returns CollectionResponseWithTotalParticipationBreakdownForwardPaging|error {
        string resourcePath = string `/participations/${getEncodedUri(marketingEventId)}/breakdown`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # Read participations counters by Marketing Event external identifier
    #
    # + externalAccountId - The accountId that is associated with this marketing event in the external event application.
    # + externalEventId - The id of the marketing event in the external event application.
    # + headers - Headers to be sent with the request 
    # + return - successful operation 
    resource isolated function get participations/[string externalAccountId]/[string externalEventId](map<string|string[]> headers = {}) returns AttendanceCounters|error {
        string resourcePath = string `/participations/${getEncodedUri(externalAccountId)}/${getEncodedUri(externalEventId)}`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # Read participations breakdown by Marketing Event external identifier
    #
    # + externalAccountId - The accountId that is associated with this marketing event in the external event application.
    # + externalEventId - The id of the marketing event in the external event application.
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - successful operation 
    resource isolated function get participations/[string externalAccountId]/[string externalEventId]/breakdown(map<string|string[]> headers = {}, *GetParticipationsExternalaccountidExternaleventidBreakdown_getparticipationsbreakdownbyexternaleventidQueries queries) returns CollectionResponseWithTotalParticipationBreakdownForwardPaging|error {
        string resourcePath = string `/participations/${getEncodedUri(externalAccountId)}/${getEncodedUri(externalEventId)}/breakdown`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # Read participations breakdown by Contact identifier
    #
    # + contactIdentifier - The identifier of the Contact. It may be email or internal id.
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - successful operation 
    resource isolated function get participations/contacts/[string contactIdentifier]/breakdown(map<string|string[]> headers = {}, *GetParticipationsContactsContactidentifierBreakdown_getparticipationsbreakdownbycontactidQueries queries) returns CollectionResponseWithTotalParticipationBreakdownForwardPaging|error {
        string resourcePath = string `/participations/contacts/${getEncodedUri(contactIdentifier)}/breakdown`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        return self.clientEp->get(resourcePath, httpHeaders);
    }

    # Update Marketing Event by objectId
    #
    # + objectId - The internal ID of the marketing event in HubSpot
    # + headers - Headers to be sent with the request 
    # + return - successful operation 
    resource isolated function patch [string objectId](MarketingEventPublicUpdateRequestV2 payload, map<string|string[]> headers = {}) returns MarketingEventPublicDefaultResponseV2|error {
        string resourcePath = string `/${getEncodedUri(objectId)}`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->patch(resourcePath, request, httpHeaders);
    }

    # Update Marketing Event by External IDs
    #
    # + externalEventId - The id of the marketing event in the external event application
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - successful operation 
    resource isolated function patch events/[string externalEventId](MarketingEventUpdateRequestParams payload, map<string|string[]> headers = {}, *PatchEventsExternaleventid_updateQueries queries) returns MarketingEventPublicDefaultResponse|error {
        string resourcePath = string `/events/${getEncodedUri(externalEventId)}`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->patch(resourcePath, request, httpHeaders);
    }

    # Update the application settings
    #
    # + appId - The id of the application to update the settings for.
    # + headers - Headers to be sent with the request 
    # + return - successful operation 
    resource isolated function post [int:Signed32 appId]/settings(EventDetailSettingsUrl payload, map<string|string[]> headers = {}) returns EventDetailSettings|error {
        string resourcePath = string `/${getEncodedUri(appId)}/settings`;
        map<anydata> queryParam = {};
        if self.apiKeyConfig is ApiKeysConfig {
            queryParam["hapikey"] = self.apiKeyConfig?.hapikey;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Record Participants by ContactId with Marketing Event Object Id
    #
    # + objectId - The internal id of the marketing event in HubSpot
    # + subscriberState - The attendance state value. It may be 'register', 'attend' or 'cancel'
    # + headers - Headers to be sent with the request 
    # + return - successful operation 
    resource isolated function post [string objectId]/attendance/[string subscriberState]/create(BatchInputMarketingEventSubscriber payload, map<string|string[]> headers = {}) returns BatchResponseSubscriberVidResponse|error {
        string resourcePath = string `/${getEncodedUri(objectId)}/attendance/${getEncodedUri(subscriberState)}/create`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    resource isolated function post [string objectId]/attendance/[string subscriberState]/email\-create(BatchInputMarketingEventEmailSubscriber payload, map<string|string[]> headers = {}) returns BatchResponseSubscriberEmailResponse|error {
        string resourcePath = string `/${getEncodedUri(objectId)}/attendance/${getEncodedUri(subscriberState)}/email-create`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Record Participants by ContactId with Marketing Event External Ids
    #
    # + externalEventId - The id of the marketing event in the external event application
    # + subscriberState - The new subscriber state for the HubSpot contacts and the specified marketing event. For example: 'register', 'attend' or 'cancel'.
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - successful operation 
    resource isolated function post attendance/[string externalEventId]/[string subscriberState]/create(BatchInputMarketingEventSubscriber payload, map<string|string[]> headers = {}, *PostAttendanceExternaleventidSubscriberstateCreate_recordbycontactidsQueries queries) returns BatchResponseSubscriberVidResponse|error {
        string resourcePath = string `/attendance/${getEncodedUri(externalEventId)}/${getEncodedUri(subscriberState)}/create`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    resource isolated function post attendance/[string externalEventId]/[string subscriberState]/email\-create(BatchInputMarketingEventEmailSubscriber payload, map<string|string[]> headers = {}, *PostAttendanceExternaleventidSubscriberstateEmailCreate_recordbycontactemailsQueries queries) returns BatchResponseSubscriberEmailResponse|error {
        string resourcePath = string `/attendance/${getEncodedUri(externalEventId)}/${getEncodedUri(subscriberState)}/email-create`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Delete Multiple Marketing Events by ObjectId
    #
    # + headers - Headers to be sent with the request 
    # + return - No content 
    resource isolated function post batch/archive(BatchInputMarketingEventPublicObjectIdDeleteRequest payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/batch/archive`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Update Multiple Marketing Events by ObjectId
    #
    # + headers - Headers to be sent with the request 
    # + return - successful operation 
    resource isolated function post batch/update(BatchInputMarketingEventPublicUpdateRequestFullV2 payload, map<string|string[]> headers = {}) returns BatchResponseMarketingEventPublicDefaultResponseV2|BatchResponseMarketingEventPublicDefaultResponseV2WithErrors|error {
        string resourcePath = string `/batch/update`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Create a marketing event
    #
    # + headers - Headers to be sent with the request 
    # + return - successful operation 
    resource isolated function post events(MarketingEventCreateRequestParams payload, map<string|string[]> headers = {}) returns MarketingEventDefaultResponse|error {
        string resourcePath = string `/events`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    resource isolated function post events/[string externalEventId]/[string subscriberState]/email\-upsert(BatchInputMarketingEventEmailSubscriber payload, map<string|string[]> headers = {}, *PostEventsExternaleventidSubscriberstateEmailUpsert_upsertbycontactemailQueries queries) returns http:Response|error {
        string resourcePath = string `/events/${getEncodedUri(externalEventId)}/${getEncodedUri(subscriberState)}/email-upsert`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Record a subscriber state by contact ID
    #
    # + externalEventId - The id of the marketing event in the external event application
    # + subscriberState - The new subscriber state for the HubSpot contacts and the specified marketing event. For example: 'register', 'attend' or 'cancel'.
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - An error occurred. 
    resource isolated function post events/[string externalEventId]/[string subscriberState]/upsert(BatchInputMarketingEventSubscriber payload, map<string|string[]> headers = {}, *PostEventsExternaleventidSubscriberstateUpsert_upsertbycontactidQueries queries) returns http:Response|error {
        string resourcePath = string `/events/${getEncodedUri(externalEventId)}/${getEncodedUri(subscriberState)}/upsert`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Mark a marketing event as cancelled
    #
    # + externalEventId - The id of the marketing event in the external event application
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - successful operation 
    resource isolated function post events/[string externalEventId]/cancel(map<string|string[]> headers = {}, *PostEventsExternaleventidCancel_cancelQueries queries) returns MarketingEventDefaultResponse|error {
        string resourcePath = string `/events/${getEncodedUri(externalEventId)}/cancel`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Mark a marketing event as completed
    #
    # + externalEventId - The id of the marketing event in the external event application.
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - successful operation 
    resource isolated function post events/[string externalEventId]/complete(MarketingEventCompleteRequestParams payload, map<string|string[]> headers = {}, *PostEventsExternaleventidComplete_completeQueries queries) returns MarketingEventDefaultResponse|error {
        string resourcePath = string `/events/${getEncodedUri(externalEventId)}/complete`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Delete Multiple Marketing Events by External Ids
    #
    # + headers - Headers to be sent with the request 
    # + return - An error occurred. 
    resource isolated function post events/delete(BatchInputMarketingEventExternalUniqueIdentifier payload, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/events/delete`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Create or Update Multiple Marketing Events
    #
    # + headers - Headers to be sent with the request 
    # + return - successful operation 
    resource isolated function post events/upsert(BatchInputMarketingEventCreateRequestParams payload, map<string|string[]> headers = {}) returns BatchResponseMarketingEventPublicDefaultResponse|error {
        string resourcePath = string `/events/upsert`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, httpHeaders);
    }

    # Associate a list with a marketing event
    #
    # + externalAccountId - The accountId that is associated with this marketing event in the external event application.
    # + externalEventId - The id of the marketing event in the external event application.
    # + listId - The ILS ID of the list.
    # + headers - Headers to be sent with the request 
    # + return - No content 
    resource isolated function put associations/[string externalAccountId]/[string externalEventId]/lists/[string listId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/associations/${getEncodedUri(externalAccountId)}/${getEncodedUri(externalEventId)}/lists/${getEncodedUri(listId)}`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        return self.clientEp->put(resourcePath, request, httpHeaders);
    }

    # Associate a list with a marketing event
    #
    # + marketingEventId - The internal id of the marketing event in HubSpot.
    # + listId - The ILS ID of the list.
    # + headers - Headers to be sent with the request 
    # + return - No content 
    resource isolated function put associations/[string marketingEventId]/lists/[string listId](map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/associations/${getEncodedUri(marketingEventId)}/lists/${getEncodedUri(listId)}`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        return self.clientEp->put(resourcePath, request, httpHeaders);
    }

    # Create or update a marketing event
    #
    # + externalEventId - The id of the marketing event in the external event application
    # + headers - Headers to be sent with the request 
    # + return - successful operation 
    resource isolated function put events/[string externalEventId](MarketingEventCreateRequestParams payload, map<string|string[]> headers = {}) returns MarketingEventPublicDefaultResponse|error {
        string resourcePath = string `/events/${getEncodedUri(externalEventId)}`;
        map<anydata> headerValues = {...headers};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["private-app-legacy"] = self.apiKeyConfig?.private\-app\-legacy;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, httpHeaders);
    }
}
