;; 10. Generate a loop that conditionally triggers `unreachable`, with an external block expecting different stack types based on the loop completion. Test for correct typification compliance as control transits between loop and block.

(assert_invalid
  (module (func $loop-unreachable-type-mismatch
    (block (result i32)
      (loop 
        (br_if 0 (i32.const 1))
        (unreachable)
      )
      (f32.const 1.0)
    )
  ))
  "type mismatch"
)