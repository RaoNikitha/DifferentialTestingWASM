;; 2. Develop a module where a `call_indirect` inside a nested loop calls a function indirectly based on an indexed value that changes with each loop iteration. Check if the loop correctly maintains the depth context for every `call_indirect` invocation.

(assert_invalid
  (module
    (func $f1 (param i32) (result i32) (i32.const 42))
    (func $f2 (param) (result i32) (i32.const 0))
    (table funcref (elem $f1 $f2))
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (result i32)))
    (func $nested_loops
      (local $i i32) (local $j i32)
      (local.set $i (i32.const 0))
      (block
        (loop
          (local.set $j (i32.const 0))
          (block
            (loop
              (call_indirect (type $sig2) (local.get $j) (i32.const 1))
              (local.set $j (i32.add (local.get $j) (i32.const 1)))
              (br_if 0 (i32.lt_s (local.get $j) (i32.const 5)))
            )
          )
          (local.set $i (i32.add (local.get $i) (i32.const 1)))
          (br_if 0 (i32.lt_s (local.get $i) (i32.const 3)))
        )
      )
    )
  )
  "type mismatch"
)