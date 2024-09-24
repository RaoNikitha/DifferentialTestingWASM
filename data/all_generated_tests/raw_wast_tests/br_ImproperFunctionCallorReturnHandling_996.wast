;; 7. **Test Description:** A block containing a `call_indirect` with a subsequent `br` to an enclosing block. The indirectly called function has its own blocks and loops.    **Constraint Checked:** Confirm label lookup correctness post indirect call with nested blocks.    **Relation to Function Call/Return Handling:** Ensures proper call and return execution when label indices span indirect call boundaries.

(assert_invalid
  (module
    (type $t (func))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f
      (block
        (call_indirect (type $t) (i32.const 0))
        (block (br 1))
      )
    )
    (func
      (block (result i32)
        (i32.const 0)
        (block
          (br 1)
        )
      )
    )
  )
)