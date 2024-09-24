;; 10. Structure a complex flow with consecutive `br_table` instructions, the second of which evaluates to an out-of-bounds index having subsequent `unreachable` instructions, assessing deep error resilience against nested table checks.

(assert_invalid
  (module 
    (func $test
      (block
        (block (result i32)
          (unreachable)
          (br_table 0 1 2 (i32.const 3))
        )
        (drop)
      )
      (block
        (block (result f32)
          (unreachable)
          (br_table 0 1 2 (i32.const 3))
        )
        (drop)
      )
    )
  )
  "type mismatch"
)