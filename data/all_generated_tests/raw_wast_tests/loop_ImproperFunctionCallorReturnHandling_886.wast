;; Develop a module where a `call_indirect` within a loop uses a table that changes after each iteration of the loop, verifying if the function type validation adjusts dynamically across iterations in different implementations.

(assert_invalid
  (module
    (type $t0 (func (result i32)))
    (func $f0 (type $t0) (i32.const 0))
    (table 1 funcref)
    (elem (i32.const 0) $f0)
    (func (result i32)
      (loop (result i32)
        (call_indirect (type $t0) (i32.const 0))
        (i32.const 0)   ;; Change the table entry
        (table.set (i32.const 0))
        (br 1)
      )
    )
  )
  "type mismatch"
)