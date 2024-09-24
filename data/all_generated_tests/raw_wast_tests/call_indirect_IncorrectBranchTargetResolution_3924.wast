;; 3. Call a function indirectly using `call_indirect` with a correct type index but use a branch instruction within the function that targets a label defined in another function. The error handling for incorrect label targets should trap correctly.

(assert_invalid
  (module
    (type (func))
    (type (func (param i32)))
    (table 1 funcref)
    (elem (i32.const 0) funcref 1)
    (func (type 0) (block) (call_indirect (type 1) (i32.const 0)) (br 1))
    (func (type 1) (param i32))
  )
  "invalid label"
)