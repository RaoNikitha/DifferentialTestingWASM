;; 5. Test conditional branch (`br_if`) using operand stack values to control looping behavior, verifying that stack management does not inadvertently create an infinite loop by failing to break when expected.

(assert_invalid
 (module
  (func
   (block (result i32)
    (loop (result i32)
     (br 1)
     (br_if 0 (i32.const 1))
    )
   )
  )
 )
 "type mismatch"
)