;; 3. A scenario with a single `loop` where an unreachable code follows a `return` within the loop. Validate if the return instruction is respected and the unreachable code is correctly discarded.

(assert_invalid
  (module
    (func $loop-unreachable-after-return
      (local i32)
      (loop
        (return)
        unreachable
      )
    )
  )
  "unreachable code after return"
)