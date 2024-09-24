;; Develop a test with multiple labeled blocks nested under a main block, each containing a `call_indirect` instruction. Use `br_table` to test jumps to different labels and ensure consistent stack state and call resolution under varied depths.

(assert_invalid
  (module
    (type $functype (func (param i32) (result i32)))
    (table funcref (elem $func1 $func2))
    (func $func1 (param i32) (result i32) (i32.const 42))
    (func $func2 (param i32) (result i32) (i32.add (local.get 0) (i32.const 1)))
    (func (block
      (block $label1
        (block $label2
          (block $label3
            (br_table $label1 $label2 $label3
              (call_indirect (type $functype) (i32.const 0) (i32.const 0))
            )
          )
        )
      )
    ))
  )
  "type mismatch"
)