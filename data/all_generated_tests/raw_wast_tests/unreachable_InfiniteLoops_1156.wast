;; 7. Define an infinite loop that includes a call to another function, which contains `unreachable`. Ensure that upon calling the function with `unreachable`, the loop causes a trap rather than looping indefinitely.

(assert_invalid
  (module
    (func $callee
      unreachable
    )
    (func $caller
      (loop
        (call $callee)
        br 0
      )
    )
  )
  "type mismatch"
)