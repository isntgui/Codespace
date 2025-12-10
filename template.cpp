#include <bits/stdc++.h>
using namespace std;

#ifdef o_0
    #include "debugging.h"
#endif

using ll = long long int;

#define sum accumulate
#define all(a) a.begin(), a.end()
#define rall(a) a.rbegin(), a.rend()

constexpr int mxn = 2e5 + 10,
              INF = 1e9 + 10;

pair<int, int> pref[mxn];
pair<int, int> suff[mxn];
int a[mxn], n;
int resp[mxn];

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    cin >> n;
    for (int i = 0; i < n; i++) {
        cin >> a[i];
        resp[i] = (a[i] == -1 ? 0 : a[i]);
    }
    pref[0].first = INF, pref[0].second = -1;
    for (int i = 1; i <= n; i++) {
        pref[i] = make_pair(a[i - 1], i);
        if (a[i - 1] == -1)
            pref[i] = pref[i - 1];
    }
    suff[n + 1].first = INF, suff[n + 1].second = -1;
    for (int i = n; i >= 1; i--) {
        suff[i] = make_pair(a[i - 1], i);
        if (a[i - 1] == -1)
            suff[i] = suff[i + 1];
    }
    for (int i = 0; i < n; i++) {
        if (resp[i]) {
            cout << resp[i];
        }
        else {
            int ans = min(max(suff[i + 1].first + suff[i + 1].second - i - 1, suff[i + 1].first - suff[i + 1].second + i + 1),
                    max(pref[i + 1].first + pref[i + 1].second - i - 1, pref[i + 1].first - pref[i + 1].second + i + 1));
            cout << ans;
        }
        cout << " \n"[i + 1 == n];
    }
}
