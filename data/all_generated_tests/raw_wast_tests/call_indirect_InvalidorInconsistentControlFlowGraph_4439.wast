;; Produce a script with an indirect call to a function that contains early returns within nested loops, checking that the CFG handles immediate returns correctly from various nested levels.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem $f))
    (func $f (param i32) (result i32)
      (loop
        (block
          (br_if 1 (i32.eqz (local.get 0)))
          (loop
            (block
              (br_if 1 (i32.eq (local.get 0) (i32.const 1)))
              (return (i32.const 42))
            )
            (br 0)
          )
        )
        (local.get 0)
      )
    )
    (func (export "test") (param i32 i32) (result i32)
      (call_indirect (type $sig) (local.get 0) (local.get 1))
    )
  )
  "type mismatch"
)