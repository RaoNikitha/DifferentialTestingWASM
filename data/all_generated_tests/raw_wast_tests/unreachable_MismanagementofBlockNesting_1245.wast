;; 6. Include an `unreachable` in a deep nested structure of `block`, `loop`, and `if` statements, followed by a `br_if` to varying depths. Checks the interpreter/engine properly navigates out of the right blocks/loops after hitting an `unreachable` and executing a `br_if`.

(assert_invalid
  (module (func $nested-structure-unreachable-br_if
    (block
      (loop
        (block
          (if (i32.const 1)
            (then
              (unreachable)
            )
          )
          (br_if 1 (i32.const 0))
        )
      )
    )
  ))
  "type mismatch"
)