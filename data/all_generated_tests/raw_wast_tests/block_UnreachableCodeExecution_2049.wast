;; 10. Create nested blocks where an `if` construct with improper label referencing produces a wrong jump, landing on an unreachable instruction. This checks for control flow mishandling in more complex conditional nested paths.

(assert_invalid
  (module
    (func $nested-blocks-with-if
      (block (result i32)
        (block
          (i32.const 1)
          (if (result i32)
            (i32.eqz)
            (then (br 2 (i32.const 42))) ; This should result in invalid control flow
            (else (drop))
          )
        )
        (br 0)
      )
    )
  )
  "type mismatch"
)