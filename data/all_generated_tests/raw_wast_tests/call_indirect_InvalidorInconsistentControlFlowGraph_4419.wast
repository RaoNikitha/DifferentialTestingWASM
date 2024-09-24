;; 8. **Conditional Loop Structure with Mixed Validity**:    - Build a complex loop structure with conditionals that use `call_indirect` inside, where calls have mixed valid and invalid function references.    - Check the CFG to ensure all paths are appropriately validated and any invalid references correctly result in traps without affecting valid paths.

(assert_invalid
  (module
    (type $sig1 (func (param i32 i32) (result i32)))
    (type $sig2 (func (param i32) (result i32)))
    (func $f1 (param $p1 i32) (param $p2 i32) (result i32)
      (i32.add (local.get $p1) (local.get $p2))
    )
    (func $f2 (param $p1 i32) (result i32)
      (i32.const 0)
    )
    (table $table1 2 funcref)
    (elem (i32.const 0) $f1 $f2)
    (func (param $x i32) (result i32)
      (local $y i32)
      (block $outer
        (loop $loop
          (if (i32.eqz (local.get $x))
            (then
              (local.set $y (call_indirect (type $sig2) (local.get $x) (i32.const 0))))
            (else
              (local.set $y (call_indirect (type $sig1) (i32.const 0) (local.get $x) (local.get $x))))
          )
          (local.set $x (i32.sub (local.get $x) (i32.const 1)))
          (br_if $loop (i32.gt_s (local.get $x) (i32.const 0)))
        )
      )
      (local.get $y)
    )
  )
  "type mismatch"
)