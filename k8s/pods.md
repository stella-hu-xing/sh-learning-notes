# Labels and Selectors

Labels are key/value pairs that are attached to objects such as Pods.

Labels are intended to be used to specify identifying attributes of objects that are meaningful and relevant to users, but do not directly imply semantics to the core system.

```
"metadata": {
  "labels": {
    "key1" : "value1",
    "key2" : "value2"
  }
}
```

labels do not provide `uniqueness`. In general, we expect many objects to carry the same label(s).

Via a `label selector`, the client/user can identify a set of objects. The label selector is the core grouping primitive in Kubernetes.

`k get pods --selector <key>=<value>`

# Annotations

Use Kubernetes annotations to attach arbitrary non-identifying metadata to objects.

Annotations are not used to identify and select objects.

```
"metadata": {
  "annotations": {
    "key1" : "value1",
    "key2" : "value2"
  }
}
```

The keys and the values in the map must be strings. In other words, you cannot use numeric, boolean, list or other types for either the keys or the values.
