;; 8. Create a structure with alternated `if`, `block`, and `loop`, embedding an `unreachable` inside the deepest layer and following up with a series of `br` statements simulating attempts to break from various depths, expecting immediate exits.

(assert_invalid
  (module (func $complex-nested-structure
    (if (i32.const 1)
      (block
        (loop
          (unreachable)
          (br 2)
        )
        (br 1)
      )
    )
    (i32.const 0)
  ))
  "type mismatch"
)