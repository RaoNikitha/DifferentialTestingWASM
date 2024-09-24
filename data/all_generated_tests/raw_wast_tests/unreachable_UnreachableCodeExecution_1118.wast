;; 9. Create a function that processes an array via a loop and includes an erroneous access condition within the loop that results in an `unreachable` instruction to test if the loop execution traps correctly.

(assert_invalid
  (module
    (func $process-array
      (local $i i32) (local $arr_start i32) (local $arr_end i32)
      (block $exit
        (loop $main
          (local.get $i)
          (local.get $arr_start)
          (i32.add)
          (i32.load) 
          (i32.const 0)
          (i32.eq)
          (br_if 1)
          (unreachable)
        )
      )
    )
  )
  "type mismatch"
)