;; 10. Construct a series of `if` statements where improper end block nesting results in CFG inconsistencies. Tests the ability of implementations to correctly validate the nested structure and enforce well-nested block rules.

(assert_invalid
  (module
    (func $nested-if-cfg-error
      (if (i32.const 1)
        (then
          (if (i32.const 0)
            (then (i32.const 3))
            (else (i32.const 4))
            (end (unreachable))
          )
        )
      (else
        (if (i32.const 1)
          (then (i32.const 5))
          (else (i32.const 6))
          (end (unreachable))
        )
      )))
  )
  "improper nesting in if blocks"
)