;; 2. Execute an `unreachable` within an `if` condition nested inside multiple `block` structures with a `br_if` pointing to various block depths. This checks if the `br_if` references the correct block depth after the `unreachable` is executed.

(assert_invalid
  (module
    (func $nested-if-unreachable
      (block (block (block
        (if (i32.const 1)
          (then
            (unreachable)
            (br_if 1 (i32.const 1))
          )
        )
      )))
    )
  )
  "type mismatch"
)