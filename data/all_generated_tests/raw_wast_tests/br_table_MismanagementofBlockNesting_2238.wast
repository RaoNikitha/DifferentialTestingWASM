;; 8. **Test Description:** Formulate a scenario where nested `loop`s incorporate `br_table` instructions referencing siblings and ancestors. Validate if the branch instruction correctly handles the operand stack and iterates within the correct loop, without mistakenly exiting to other nested or outer scopes.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (loop (result i32)
        (block (result i32)
          (loop (result i32)
            (block (result i32)
              (br_table 0 1 2 (local.get 0) (i32.const 0))
            )
          )
          (i32.const 0)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)