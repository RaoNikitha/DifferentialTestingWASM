;; 4. **Index Out Of Bound**:    - Use a `call_indirect` with an index that is out of the bounds of the number of elements in the table. This should trigger a trap related to index out-of-bound access, which might be inconsistently handled by different implementations causing additional stack corruption.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref  (elem null))
    (func (result i32)
      (call_indirect (type 0) (i32.const 1))
    )
  )
  "out of bounds"
)