/*
 * Copyright (c) 2008-2016 Computer Network Information Center (CNIC), Chinese Academy of Sciences.
 * 
 * This file is part of Duckling project.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License. 
 *
 */
package cn.vlabs.umt.oauth.common.token;

/**
 *
 */
public class BasicOAuthToken implements OAuthToken {
    protected String accessToken;
    protected Long expiresIn;
    protected String refreshToken;
    protected String scope;

    public BasicOAuthToken() {
    }

    public BasicOAuthToken(String accessToken, Long expiresIn, String refreshToken, String scope) {
        this.accessToken = accessToken;
        this.expiresIn = expiresIn;
        this.refreshToken = refreshToken;
        this.scope = scope;
    }

    public BasicOAuthToken(String accessToken) {
        this(accessToken, null, null, null);
    }

    public BasicOAuthToken(String accessToken, Long expiresIn) {
        this(accessToken, expiresIn, null, null);
    }

    public BasicOAuthToken(String accessToken, Long expiresIn, String scope) {
        this(accessToken, expiresIn, null, scope);
    }

    public String getAccessToken() {
        return accessToken;
    }

    public Long getExpiresIn() {
        return expiresIn;
    }

    public String getRefreshToken() {
        return refreshToken;
    }

    public String getScope() {
        return scope;
    }
}