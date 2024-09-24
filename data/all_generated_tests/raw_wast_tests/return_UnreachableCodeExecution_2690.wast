;; Test 9: Set up a sequence where the return instruction has polymorphic return types and an intermediate instruction failure leading to `unreachable`; verify early return prevents such an intermediate leave to `unreachable`.

(assert_invalid
  (module
    (func $type-value-polymorphic-vs-unreachable
      (block
        (return)
        unreachable
      )
    )
  )
  "type mismatch"
)