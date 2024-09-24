;; 1. Test a `call_indirect` instruction within a nested loop where the table index should select a function with the correct type signature, but due to a branching error, the control flow skips a level and terminates prematurely, causing the indirect call to resolve incorrectly.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func $func (result i32)
      (loop
        (block
          (br 2)
        )
        (call_indirect (type $sig) (i32.const 0))
      )
      (i32.const 0)
    )
    (table funcref (elem $func))
  )
  "unknown table"
)