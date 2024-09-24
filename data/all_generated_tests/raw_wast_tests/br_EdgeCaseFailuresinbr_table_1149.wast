;; 10. **Test Description 10:**    Develop a branching scenario where a `br_table` redirects to labels within another `br_table`, increasing complexity and potential nesting depth issues. This tests if each engine can correctly manage multi-layered indirect branches without stack corruption.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block
        (block
          (loop (result i32)
            (block (result f32)
              (br_table 1 0 (local.get 0))
              (br_table 2 1 (local.get 0))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)