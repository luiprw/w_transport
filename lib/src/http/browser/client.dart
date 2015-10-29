// Copyright 2015 Workiva Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

library w_transport.src.http.browser.client;

import 'package:w_transport/src/http/browser/requests.dart';
import 'package:w_transport/src/http/client.dart';
import 'package:w_transport/src/http/common/client.dart';
import 'package:w_transport/src/http/requests.dart';

/// Browser-specific implementation of an HTTP client. In the browser, there is
/// no true HTTP client available that allows caching network connections like
/// the Dart VM provides. Consequently, this implementation acts as a simple
/// factory for each type of request. It does, however, still retain the benefit
/// that all outstanding requests will be canceled when this client is closed.
class BrowserClient extends CommonClient implements Client {
  /// Constructs a new [FormRequest] that will use this client to send the
  /// request. Throws a [StateError] if this client has been closed.
  @override
  FormRequest newFormRequest() {
    verifyNotClosed();
    FormRequest request = new BrowserFormRequest();
    registerRequest(request);
    return request;
  }

  /// Constructs a new [JsonRequest] that will use this client to send the
  /// request. Throws a [StateError] if this client has been closed.
  @override
  JsonRequest newJsonRequest() {
    verifyNotClosed();
    JsonRequest request = new BrowserJsonRequest();
    registerRequest(request);
    return request;
  }

  /// Constructs a new [MultipartRequest] that will use this client to send the
  /// request. Throws a [StateError] if this client has been closed.
  @override
  MultipartRequest newMultipartRequest() {
    verifyNotClosed();
    MultipartRequest request = new BrowserMultipartRequest();
    registerRequest(request);
    return request;
  }

  /// Constructs a new [Request] that will use this client to send the request.
  /// Throws a [StateError] if this client has been closed.
  @override
  Request newRequest() {
    verifyNotClosed();
    Request request = new BrowserPlainTextRequest();
    registerRequest(request);
    return request;
  }

  /// Constructs a new [StreamedRequest] that will use this client to send the
  /// request. Throws a [StateError] if this client has been closed.
  @override
  StreamedRequest newStreamedRequest() {
    verifyNotClosed();
    StreamedRequest request = new BrowserStreamedRequest();
    registerRequest(request);
    return request;
  }
}