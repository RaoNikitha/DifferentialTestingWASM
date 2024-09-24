;; 8. Have multiple `block` instructions in sequence with a `br` in the inner block that mistakenly assumes an operand type from a sibling block. This will check for the proper scoping and type enforcement within sibling structured control instructions.

(assert_invalid
  (module
    (func
      (block (result i32)
        (block
          (block
            (br 0 (i64.const 0))
          )
        )
      )
    )
  )
  "type mismatch"
)