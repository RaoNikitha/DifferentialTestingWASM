;; 6. Have multiple back-to-back `call` instructions within a `block`, followed by a `br` targeting the concluding `end` of another external loop to verify if function returns are mishandled, leading to unexecuted subsequent calls.

(assert_invalid
  (module
    (func $test
      (block
        (call $func1)
        (call $func2)
        (br 1)
      )
      (loop $outer
        (call $func3)
        (call $func4)
        (br $outer)
      )
    )
    (func $func1)
    (func $func2)
    (func $func3)
    (func $func4)
  )
  "unknown label"
)