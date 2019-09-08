# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def reverse_k_group(head, k)
    return head if k <= 1
    temp=head
    subHead=nil
    while temp != nil
        if temp == head
            temp=head
            var=temp
            temp=temp.next
            var.next=nil
            reverseStart=var
            count=1
            while count < k
                if temp == nil && count < k
                    var=reverseStart
                    reverseStart=reverseStart.next
                    var.next=nil
                    start=var
                    count-=1
                    while count > 0
                        var=reverseStart
                        reverseStart=reverseStart.next
                        var.next=nil
                        var.next=start
                        start=var
                        count-=1
                    end
                    return head
                end
                var=temp
                temp=temp.next
                var.next=nil
                var.next=reverseStart
                reverseStart=var
                count+=1
            end
            subHead=head
            head.next=temp
            head=reverseStart
        else
            var=temp
            temp=temp.next
            var.next=nil
            reverseStart=var
            count=1
            tail=reverseStart
            while count < k
                if temp == nil && count < k
                    var=reverseStart
                    reverseStart=reverseStart.next
                    var.next=nil
                    start=var
                    count-=1
                    while count > 0
                        var=reverseStart
                        reverseStart=reverseStart.next
                        var.next=nil
                        var.next=start
                        start=var
                        count-=1
                    end
                    subHead.next=start
                    return head
                end
                var=temp
                temp=temp.next
                var.next=nil
                var.next=reverseStart
                reverseStart=var
                count+=1
            end
            tail.next=temp
            subHead.next=reverseStart
            subHead=tail
        end
    end
    return head
end
