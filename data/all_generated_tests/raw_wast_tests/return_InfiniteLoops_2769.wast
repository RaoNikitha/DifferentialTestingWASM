;; 8. Write a function that uses a loop to compute factorial recursively with a `return` instruction for terminating when the factorial result is equal to a threshold. Ensure the loop terminates precisely when the `return` condition matches.

(assert_invalid
  (module
    (func $factorial-loop-conditional-return (param $n i32) (result i32)
      (local $result i32)
      (local.set $result (i32.const 1))
      (block 
        (loop 
          (if 
            (i32.eq (local.get $n) (i32.const 0)) 
            (then 
              (return (local.get $result))
            )
          )
          (local.set $result
            (i32.mul (local.get $result) (local.get $n))
          )
          (local.set $n
            (i32.sub (local.get $n) (i32.const 1))
          )
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)