=begin
  This file is a cotribution to Viewpoint; the Ruby library for Microsoft Exchange Web Services.

  Copyright © 2013 Mark McCahill <mark.mccahill@duke.edu>

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
=end

module Viewpoint::EWS::SOAP
  class EwsSoapGetStreamingEventsResponse < EwsSoapResponse
    include Viewpoint::StringUtils

    Notification = Struct.new(:subscription_id, :events)

    # def subscription_ids
    #   notifications.map(&:subscription_id)
    # end

    def notifications
      @notifications ||= []
      notification_hashes.each do |notification_hash|
        notification_event_hash = notification_event_hashes(notification_hash: notification_hash)
        @notifications << notification_hash
        # @notifications << Notification.new(
        #   subscription_id: subscription_id(notification_event_hash: notification_event_hash),
        #   events: events(notification_event_hash: notification_event_hash)
        # )
      end
    end

    def notification_hashes
      guard_hash(response_message[:elems], [:notifications, :elems])
    end

    def notification_event_hashes(notification_hash:)
      guard_hash(notification_hash, [:notification, :elems])
    end

    def subscription_id(notification_event_hashes:)
      # notification_event_hash.first.dig(:subscription_id, :text)
      notification_event_hashes[0][:subscription_id][:text]
    end

    def events(notification_event_hashes:)
      @events ||= notification_event_hashes[1..-1].map { |event| Viewpoint::EWS::SOAP::GetStreamingEventResponse.new(event) }
    end

    def error_subscription_ids
      ids = guard_hash(response_message[:elems], [:error_subscription_ids, :elems])

      if ids
        ids.map { |id| id[:subscription_id][:text] }
      else
        []
      end
    end

  end # END class EwsSoapGetStreamingEventsResponse < EwsSoapResponse
end # Viewpoint::EWS::SOAP
