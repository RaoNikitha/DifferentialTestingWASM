;; 3. **Out-of-Bounds Table Index:**    - Validate the handling of `call_indirect` when the provided index is outside the bounds of the table. Ensure that an error or trap occurs, checking whether OCaml's `require` function and Java's conditional error checks correctly enforce index validity.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (func (param i32) (result i32)
      (call_indirect (type 0) (i32.const 2))
    )
  )
  "out of bounds table index"
)