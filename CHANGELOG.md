# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.2.17] - 2020-01-29

### Added

- Option to authenticate via OAuth passing an `Authorization` value to the HTTPClient header

## [1.2.17]

### Changed

- Now set the custom cookies when calling the get streaming events call, allow cookies to be other than just `X-BackendOverrideCookie`

## [1.2.16]

### Changed

- Now set the custom cookies when calling the get streaming events call, allow cookies to be other than just `X-BackendOverrideCookie`

## [1.2.15]

### Changed

- The folder will now response to .cookies which returns all cookies returned in the Set-Cookie header

## [1.2.14]

### Changed

- Fixed a bug where there was an unknown method

## [1.2.13]

### Changed

- Fixed a bug where an erroneous log statement was placed.

## [1.2.12]

### Changed

- Implemented ability to pass custom headers for the get streaming events call

## [1.2.11]

### Changed

- Implemented new headers for Exchange 2016
- Implemented a way to pass a customer logger when initializing the gem
- Added log statements before and after making the request to Exchange with the uniq id of the request

## [1.2.10]

### Changed

- Implemented ErrorExceededFindCountLimit to handle an issue with find_items_between returning ErrorExceededFindCountLimit error

## [1.2.9]

### Changed

- Fixed an issue with XML string contains special charter or invalid elements fails the parsing response

## [1.2.8]

### Changed

- Fixed an issue with too many arguments being passed to the recurring_master_item_id! method in the ews builder

## [1.2.7]

### Changed

- Fixed an issue with too many arguments being passed to the occurrence_item_id! method in the ews builder

## [1.2.6]

### Changed

- Fixed an issue where there was a duplication of methods in the soap builder

## [1.2.5]

### Changed

- Fix an error where the only the first notification in a streaming response's envelope was processed

## [1.2.4]

### Changed

- Fix variable name error

## [1.2.3]

### Changed

- Add support for QueryString (special thank to @Fishy49 https://github.com/Fishy49)
- Include request body in all error classes for better error handling

## [1.2.2]

### Changed

- Raise `TooManyRequestsError` if HTTP response has error code 429

## [1.2.1]

### Changed

- Enhance response for recurring master so we can get ids for all its occurrence item ids in GetItem response
- Bug fixed: Generate correct XML body when updating attendees to build proper SOAP request in order to update attendees of a calendar item
- Removed: Unsupported Ruby Versions from Travis CI

## [1.2.0]

### Changed

- Bug fixed: Use correct body_type when updating a calendar item

## [1.1.9]

### Changed

- Add SendClientLatencies and ReturnClientRequestId headers

## [1.1.8]

### Changed

- Support raw HTTP header return from #streaming_subscribe
- Fixed failing rspec

## [1.1.7]

### Changed

- Bug fixed for #streaming_subscribe

## [1.1.6]

### Changed

- Fix typo

## [1.1.5]

### Changed

- Adding RequestedServerVersion to AutoDiscover #get_user_settings request

## [1.1.4]

### Changed

- Supports [Exchange Server Affinity](https://docs.microsoft.com/en-us/exchange/client-developer/exchange-web-services/how-to-maintain-affinity-between-group-of-subscriptions-and-mailbox-server#how-do-i-maintain-affinity-by-using-the-ews-managed-api-or-ews)

## [1.1.3]

### Changed

- Supports standard AutoDiscover endpoint
- Supports customisable http header and cookie in order to support Grouping Subscriptions

## [1.1.2]

### Changed

- Enhance `EwsSoapGetStreamingEventsResponse#error_subscription_ids` to return error_subscription_ids array if any

## [1.1.1]

### Changed

- Mostly minor bug fix and enhancements

### Added

- Make the streaming subscription default timeout to 240 minutes  (same with pull subscription)
- Use `#streaming_subscribed?` for checking if a streaming subscription is set up

### Fixed

- `CalendarFolder#items_between` and `GenericFolder#items_between` now truly support option params

## [1.1.0]

- Partially supporting Streaming Notification

## [1.0]

### Added

- SOAP backend is now only dependant on Nokogiri.
- Viewpoint is no longer built on a Singleton pattern.

### Changed

- Delegate access is supported
- One thing that was often asked for, but missing from the previous version was delegate access to mailboxes and calendars. This is now supported via the `act_as` parameter to the `GenericFolder::get_folder method`.
- There is also some support for manipulation of delegate access itself via the methods `MailboxUser#add_delegate!`, `MailboxUser#update_delegate!`, and `MailboxUser#get_delegate_info`.
