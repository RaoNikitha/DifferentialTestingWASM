;; Test 4: Create a loop where `unreachable` is in the loop body followed by another loop control instruction like `br`, ensuring that the first loop exits immediately.

(assert_invalid
  (module
    (func $loop-unreachable-followed-by-br
      (loop 
        unreachable 
        br 0
      )
      i32.const 0
    )
  )
 "unreachable executed"
)