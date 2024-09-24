;; Create a scenario with a loop containing nested blocks and place the `call_indirect` within the most inner block. Use `br_table` to branch to different depths and ensure that the `call_indirect` accurately resolves the correct block exit.

(assert_invalid
  (module
    (type $sig (func (param i32)))
    (func $dummy (param i32))
    (table funcref (elem $dummy))
    (func $test
      (loop
        (block
          (block
            (block
              (call_indirect (type $sig) (i32.const 0))
              (br_table 0 1 2 (i32.const 2))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)