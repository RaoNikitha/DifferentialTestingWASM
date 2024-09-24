;; 4. Write a testcase with a shallow `block` nested inside a deeper `loop` structure. Use an outbound `br` that targets the `block`'s label and ensure the flow control exits the proper context.

(assert_invalid
 (module
   (func
     (loop
       (block
         (br 1)
       )
     )
   )
 )
"invalid branch target"
)