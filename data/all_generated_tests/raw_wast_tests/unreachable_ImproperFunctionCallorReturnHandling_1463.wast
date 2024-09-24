;; 4. **Test Description:**    - Within a loop, call a function that includes `unreachable`, and ensure the trap unwinds the loop without further iterations.    - This test checks if loops properly terminate execution on encountering a function's `unreachable` instruction.

(assert_invalid
 (module
  (func $func_with_unreachable
   unreachable
  )
  (func $type-loop-unwind-with-unreachable
   (loop (call $func_with_unreachable) (br 0))
  )
 )
 "type mismatch"
)