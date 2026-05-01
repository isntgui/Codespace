#include <bits/stdc++.h>
using namespace std;

#if __has_include("debugging.h")
#include "debugging.h"
#else
template <typename T1, typename T2>
ostream& operator<<(ostream& out, const pair<T1, T2>& p) {
    return out << "(" << p.first << ", " << p.second << ")";
}

template <typename T, typename = void>
struct is_iterable : false_type {};

template <typename T>
struct is_iterable<
    T,
    void_t<decltype(begin(declval<T>())), decltype(end(declval<T>()))> > : true_type {};

template <>
struct is_iterable<string> : false_type {};

template <typename T>
struct is_special_container : false_type {};

template <typename... Args>
struct is_special_container<stack<Args...> > : true_type {};

template <typename... Args>
struct is_special_container<queue<Args...> > : true_type {};

template <typename... Args>
struct is_special_container<priority_queue<Args...> > : true_type {};

template <typename T>
enable_if_t<is_iterable<T>::value && !is_special_container<T>::value, ostream&>
operator<<(ostream& out, const T& container) {
    out << "[";
    auto it = begin(container);
    while (it != end(container)) {
        out << *it;
        ++it;
        if (it != end(container))
            out << ", ";
    }
    return out << "]";
}

template <typename Tuple, size_t... Is>
void print_tuple(ostream& out, const Tuple& t, index_sequence<Is...>) {
    ((out << (Is ? ", " : "") << get<Is>(t)), ...);
}

template <typename... Args>
ostream& operator<<(ostream& out, const tuple<Args...>& t) {
    out << "(";
    print_tuple(out, t, index_sequence_for<Args...>{});
    return out << ")";
}

template <typename T>
ostream& operator<<(ostream& out, stack<T> s) {
    vector<T> v;
    while (!s.empty()) {
        v.push_back(s.top());
        s.pop();
    }
    reverse(v.begin(), v.end());
    return out << v;
}

template <typename T>
ostream& operator<<(ostream& out, queue<T> q) {
    vector<T> v;
    while (!q.empty()) {
        v.push_back(q.front());
        q.pop();
    }
    return out << v;
}

template <typename T>
ostream& operator<<(ostream& out, priority_queue<T> pq) {
    vector<T> v;
    while (!pq.empty()) {
        v.push_back(pq.top());
        pq.pop();
    }
    return out << v;
}
#endif

#define int long long int
#define sum accumulate
#define all(a) a.begin(), a.end()
#define rall(a) a.rbegin(), a.rend()
#define sz(a) (int)a.size()

int32_t main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    
}
