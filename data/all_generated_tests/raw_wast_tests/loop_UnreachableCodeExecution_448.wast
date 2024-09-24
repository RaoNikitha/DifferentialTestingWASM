;; Create a loop with nested blocks having local variable manipulations, where improper handling of these variables could lead to control flow hitting an `unreachable`. Check that the variable management avoids executing `unreachable`.

(assert_invalid
  (module
    (func
      (local i32)
      (loop
        (block
          local.get 0
          i32.const 1
          i32.add
          local.set 0
          local.get 0
          br_if 1
        )
        unreachable
      )
    )
  )
  "unreachable executed"
)