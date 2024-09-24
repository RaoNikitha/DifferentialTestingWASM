;; Test 7: Use an infinite loop where a `br_table` references `unreachable` instructions in some cases, aiming to break the loop correctly.

(assert_invalid
  (module 
    (func $infinite-loop-unreachable (result i32)
      (loop 
        (br_table 0 0 (unreachable))
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)